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
		public static const KILLED_ALL_ALIENS = "killed_all_aliens";
		public var shipFactory:ShipCreator;
		
		private var target:DisplayObjectContainer;
		
		private var timer:Timer;
		private var direction:int = -1;
		private var level:Number;
		
		public function BlockAliensShips(level:Number)
		{
			this.level = level;
			this.target = parent;
			shipFactory = new ShipCreator();
			
			createAlienShips();
			
			startAttack();
			
		}
		public function startAttack():void {
			for (var ship:String in ShipCreator.alienShips) {
				ShipCreator.alienShips[ship].attack = true;
			}
			var velocidad:Number = 2000 - this.level * 300;
			if (velocidad < 100) { 
				velocidad = 300;
			}
			
			timer = new Timer(velocidad, 0);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
		}
		protected function timerHandler(event:TimerEvent):void {
			if(ShipCreator.alienShips.length < 1) {
				timer.removeEventListener(TimerEvent.TIMER, timerHandler);
				timer.stop();
				dispatchEvent(new Event(KILLED_ALL_ALIENS));
			}
			if(this.width + this.x < stage.stageWidth - 100) {
				direction = -1;
				this.y += 20;
			}
			
			if(this.x < 20) {
				direction = 1;
			} 
			this.x += 20 * direction;
		}
		
		private function createAlienShips():void {
			for (var i:int = 1; i < 9; i++)
			{
				shipFactory.addShip(ShipCreator.ALIEN, this, 80 * i, 100);
			
			}
			
			for (i = 1; i < 9; i++)
			{
				shipFactory.addShip(ShipCreator.ALIEN, this, 80 * i, 140);
			
			}
			
		}
	}
}