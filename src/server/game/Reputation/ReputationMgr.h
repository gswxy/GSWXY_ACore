/*
 * Copyright (C) 2016+     AzerothCore <www.azerothcore.org>, released under GNU GPL v2 license, you may redistribute it and/or modify it under version 2 of the License, or (at your option), any later version.
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 */

#ifndef __ACORE_REPUTATION_MGR_H
#define __ACORE_REPUTATION_MGR_H

#include "Common.h"
#include "DBCStructure.h"
#include "Language.h"
#include "QueryResult.h"
#include "SharedDefines.h"
#include <map>

static uint32 ReputationRankStrIndex[MAX_REPUTATION_RANK] =
{
    LANG_REP_HATED,    LANG_REP_HOSTILE, LANG_REP_UNFRIENDLY, LANG_REP_NEUTRAL,
    LANG_REP_FRIENDLY, LANG_REP_HONORED, LANG_REP_REVERED,    LANG_REP_EXALTED
};

typedef uint32 RepListID;
struct FactionState
{
    uint32 ID;
    RepListID ReputationListID;
    int32  Standing;
    uint8 Flags;
    bool needSend;
    bool needSave;
};

typedef std::map<RepListID, FactionState> FactionStateList;
typedef std::map<uint32, ReputationRank> ForcedReactions;

class Player;

class ReputationMgr
{
public:                                                 // constructors and global modifiers
    explicit ReputationMgr(Player* owner) : _player(owner),
        _visibleFactionCount(0), _honoredFactionCount(0), _reveredFactionCount(0), _exaltedFactionCount(0), _sendFactionIncreased(false) {}
    ~ReputationMgr() {}

    void SaveToDB(CharacterDatabaseTransaction trans);
    void LoadFromDB(PreparedQueryResult result);
public:                                                 // statics
    static const int32 PointsInRank[MAX_REPUTATION_RANK];
    static const int32 Reputation_Cap;
    static const int32 Reputation_Bottom;

    static ReputationRank ReputationToRank(int32 standing);
public:                                                 // accessors
    uint8 GetVisibleFactionCount() const { return _visibleFactionCount; }
    uint8 GetHonoredFactionCount() const { return _honoredFactionCount; }
    uint8 GetReveredFactionCount() const { return _reveredFactionCount; }
    uint8 GetExaltedFactionCount() const { return _exaltedFactionCount; }

    FactionStateList const& GetStateList() const { return _factions; }

    FactionState const* GetState(FactionEntry const* factionEntry) const
    {
        return factionEntry->CanHaveReputation() ? GetState(factionEntry->reputationListID) : nullptr;
    }

    FactionState const* GetState(RepListID id) const
    {
        FactionStateList::const_iterator repItr = _factions.find (id);
        return repItr != _factions.end() ? &repItr->second : nullptr;
    }

    bool IsAtWar(uint32 faction_id) const;
    bool IsAtWar(FactionEntry const* factionEntry) const;

    int32 GetReputation(uint32 faction_id) const;
    int32 GetReputation(FactionEntry const* factionEntry) const;
    int32 GetBaseReputation(FactionEntry const* factionEntry) const;

    ReputationRank GetRank(FactionEntry const* factionEntry) const;
    ReputationRank GetBaseRank(FactionEntry const* factionEntry) const;
    uint32 GetReputationRankStrIndex(FactionEntry const* factionEntry) const
    {
        return ReputationRankStrIndex[GetRank(factionEntry)];
    };

    ReputationRank const* GetForcedRankIfAny(FactionTemplateEntry const* factionTemplateEntry) const
    {
        ForcedReactions::const_iterator forceItr = _forcedReactions.find(factionTemplateEntry->faction);
        return forceItr != _forcedReactions.end() ? &forceItr->second : nullptr;
    }

public:                                                 // modifiers
    bool SetReputation(FactionEntry const* factionEntry, int32 standing)
    {
        return SetReputation(factionEntry, standing, false, false);
    }
    bool ModifyReputation(FactionEntry const* factionEntry, int32 standing, bool spillOverOnly = false)
    {
        return SetReputation(factionEntry, standing, true, spillOverOnly);
    }

    void SetVisible(FactionTemplateEntry const* factionTemplateEntry);
    void SetVisible(FactionEntry const* factionEntry);
    void SetAtWar(RepListID repListID, bool on);
    void SetInactive(RepListID repListID, bool on);

    void ApplyForceReaction(uint32 faction_id, ReputationRank rank, bool apply);

    //! Public for chat command needs
    bool SetOneFactionReputation(FactionEntry const* factionEntry, int32 standing, bool incremental);

public:                                                 // senders
    void SendInitialReputations();
    void SendForceReactions();
    void SendState(FactionState const* faction);
    void SendStates();

private:                                                // internal helper functions
    void Initialize();
    uint32 GetDefaultStateFlags(FactionEntry const* factionEntry) const;
    bool SetReputation(FactionEntry const* factionEntry, int32 standing, bool incremental, bool spillOverOnly);
    void SetVisible(FactionState* faction);
    void SetAtWar(FactionState* faction, bool atWar) const;
    void SetInactive(FactionState* faction, bool inactive) const;
    void SendVisible(FactionState const* faction) const;
    void UpdateRankCounters(ReputationRank old_rank, ReputationRank new_rank);
private:
    Player* _player;
    FactionStateList _factions;
    ForcedReactions _forcedReactions;
    uint8 _visibleFactionCount : 8;
    uint8 _honoredFactionCount : 8;
    uint8 _reveredFactionCount : 8;
    uint8 _exaltedFactionCount : 8;
    bool _sendFactionIncreased; //! Play visual effect on next SMSG_SET_FACTION_STANDING sent
};

#endif
