package {
	import flash.display.Sprite;
	import flash.events.Event;
	import src.Ships.BlockAliensShips;
	import src.Gamer.Player;

	public class SpaceInvaders extends Sprite
	{
		
		
		public function SpaceInvaders()
		{
			super();
			
			trace("Init");
			
			var aliensBlock:BlockAliensShips = new BlockAliensShips();
			aliensBlock.addEventListener(BlockAliensShips.KILLED_ALL_ALIENS, winGameHandler);
			addChild(aliensBlock);
			
			var player:Player = new Player();
			addChild(player);
			player.initGame();
			
		}
		private function winGameHandler(event:Event):void {
			mostrarVictoria();
		}
		private function mostrarVictoria():void {
			var a:Win = new Win();
			a.x = stage.stageWidth / 2;
			a.y = stage.stageHeight / 2;
			addChild(a);
		}
	}
}
