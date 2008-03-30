package src.Ships
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.Weapons.AlienWeapon;
	import flash.display.Shape;
	
	public class AlienShip extends Ship
	{
		private var _weapon:AlienWeapon;
		private var _isAttacking:Boolean;
		
		private const aProjectiles:Array = [AlienWeapon.MINE, AlienWeapon.CANNON]
		
		public function AlienShip() {
			super();
			
		}
		override internal function drawShip():void
		{
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(-5, -10, 10, 5);
			graphics.drawRect(-20, -5, 40, 10);
			graphics.drawRect(-20, 5, 10, 5);
			graphics.drawRect(10, 5, 10, 5);
			graphics.endFill();
		}
		
		override internal function initShip():void
		{
			_isAttacking = false;
			_weapon = new AlienWeapon();
			attack = false;
			
		}
		public function set attack(value:Boolean):void {
			if(value) 
				this.addEventListener(Event.ENTER_FRAME, this.doFire);
			if(!value)
				this.removeEventListener(Event.ENTER_FRAME, this.doFire);
		}
		public function get isAttacking():Boolean {
			return _isAttacking;
		}
		override public function destroyShip():void {
			this.removeEventListener(Event.ENTER_FRAME, this.doFire);
			this.parent.removeChild(this);
			
		}
		protected function doFire(event:Event):void
		{
			if ((Math.random() * 1000) < 1)
			{
				var cProjectile:uint = aProjectiles[((Math.random() * 6) < 5) ? 1 : 0];
				
				_weapon.fire(cProjectile, stage, this.x + parent.x, this.y + parent.y + 15);
			}
		}
	}
}