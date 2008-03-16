package src.Ships
{
	import flash.display.Sprite;
	import src.Ships.ShipCreator;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.DisplayObjectContainer;

	public class BlockAliensShips extends Sprite
	{
		public var shipFactory:ShipCreator;
		
		private var target:DisplayObjectContainer;
		
		private var timer:Timer;
		private var direction:int = -1;
		
		public function BlockAliensShips(target:DisplayObjectContainer)
		{
			this.target = target;
			shipFactory = new ShipCreator();
			
			createAlienShips();
			
			timer = new Timer(2000, 0);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
			
		}
		protected function timerHandler(event:TimerEvent):void {
			if(ShipCreator.alienShips.length < 1) {
				timer.removeEventListener(TimerEvent.TIMER, timerHandler);
				timer.stop();
			}
			if(this.width + this.x > stage.stageWidth - 20) {
				direction = -1;
				this.y += 20;
			}
			
			if(this.x < 40) {
				direction = 1;
			} 
			this.x += 20 * direction;
		}
		
		private function createAlienShips():void {
			for (var i:int = 0; i < 8; i++)
			{
				shipFactory.addShip(ShipCreator.ALIEN, this,
								80 * i, 100);
			
			}
			
			for (i = 0; i < 8; i++)
			{
				shipFactory.addShip(ShipCreator.ALIEN, this,
								80 * i, 140);
			
			}
			
		}
	}
}