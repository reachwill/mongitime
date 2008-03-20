package {
	import flash.display.Sprite;
	import src.Ships.ShipCreator;
	import flash.events.Event;
	import src.Ships.BlockAliensShips;

	public class SpaceInvaders extends Sprite
	{
		
		public var shipFactory:ShipCreator;
		
		
		public function SpaceInvaders()
		{
			trace("Init");
			
			shipFactory = new ShipCreator();
			
			shipFactory.addShip(ShipCreator.HERO, this,
								this.stage.stageWidth / 2, this.stage.stageHeight - 20);
			
			
			
			var aliensBlock:BlockAliensShips = new BlockAliensShips(stage);
			addChild(aliensBlock);
			
			
		}
	}
}
