::Mod_Sellswords.HooksMod.hook("scripts/skills/perks/perk_rotation", function ( q ) {

	q.onAdded = @( __original ) function ()
	{
		__original();
		local addPerk = function ( _perk, _row = 0 )
		{
			local actor = this.getContainer().getActor();

			if (typeof actor == "instance")
			{
				actor = actor.get();
			}

			if (!this.isKindOf(actor, "player"))
			{
				return;
			}

			local bg = this.getContainer().getActor().getBackground();

			if (bg == null)
			{
				return;
			}

			bg.addPerk(_perk, _row);
		};

		if (!this.getContainer().hasSkill("perk.crFurinkazan"))
		{
			addPerk(this.Const.Perks.PerkDefs.crFurinkazan, 5);
		}
	};

	// redundant
	/* 
	o.onSerialize <- function ( _out )
	{
		this.skill.onSerialize(_out);
	};
	o.onDeserialize <- function ( _in )
	{
		this.skill.onDeserialize(_in);
	};
	*/
});
