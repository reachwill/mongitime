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
		
		private var _isAttacking:Boolean;
		
		public function BlockAliensShips(level:Number)
		{
			this.level = level;
			this.target = parent;
			shipFactory = new ShipCreator();
			
			createAlienShips();
			
			startAttack();
			
		}
		public function startAttack():void {
			_isAttacking = true;
			
			for (var ship:String in ShipCreator.alienShips) {
				ShipCreator.alienShips[ship].attack = true;
			}
			var velocidad:Number = 2000 - this.level * 300;
			if (velocidad < 100) { 
				velocidad = 300;
			}
			
			timer = new Timer(velocidad, 0);
			timer.addEventListener(TimerEvent.TIMER, attackingHandler);
			timer.start();
		}
		protected function attackingHandler(event:TimerEvent):void {
			if(attackMode) {
				for(var k:String in ShipCreator.alienShips) {
					
					var ship:AlienShip =  ShipCreator.alienShips[k];
					ship.attack = true;
				}
				
				if(ShipCreator.alienShips.length < 1) {
					timer.removeEventListener(TimerEvent.TIMER, attackingHandler);
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
			} else {
				for(var i:String in ShipCreator.alienShips) {
					
					var s:AlienShip =  ShipCreator.alienShips[i];
					s.attack = false;
				}
			}
		}
		public function get attackMode():Boolean {
			return _isAttacking;
		}
		public function set attackMode(value:Boolean):void {
			_isAttacking = value;
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