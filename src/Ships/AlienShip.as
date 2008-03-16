package src.Ships
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.Weapons.AlienWeapon;
	import flash.display.Shape;
	
	public class AlienShip extends Ship
	{
		private var weapon:AlienWeapon;
		
		private const aProjectiles:Array = [AlienWeapon.CANNON, AlienWeapon.MINE]
		
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
			weapon = new AlienWeapon();
			
			this.addEventListener(Event.ENTER_FRAME, this.doFire);
		}
		override public function destroyShip():void {
			
			if(this.stage) {
				this.removeEventListener(Event.ENTER_FRAME, this.doFire);
				this.parent.removeChild(this);
			}
		}
		protected function doFire(event:Event):void
		{
			if (Math.ceil(Math.random() * 150) == 1)
			{
				var cProjectile:uint = aProjectiles[Math.floor(Math.random() * aProjectiles.length)];
				
				weapon.fire(cProjectile, this.parent, this.x, this.y+15);
			}
		}
	}
}