package src.Ships
{
	import flash.display.Sprite;
	import src.Weapons.HeroWeapon;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.Gamer.Player
	
	public class HeroShip extends Ship
	{
		public static const DIE:String = "die";
		private var weapon:HeroWeapon;
		
		
		override internal function drawShip():void
		{
			graphics.beginFill(0x00FF00);
			graphics.drawRect(-5, -15, 10, 10);
			graphics.drawRect(-12, -5, 24, 10);
			graphics.drawRect(-20, 5, 40, 10);
			graphics.endFill();
		}
		
		override internal function initShip():void
		{
			weapon = new HeroWeapon();
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.doMoveShip);
			
		}
		public function startAttack():void {
			if (this.stage)
				this.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.doFire);
		}
		public function stopAttack():void {
			if (this.stage)
				this.stage.removeEventListener(MouseEvent.MOUSE_DOWN, this.doFire);
		}
		override public function destroyShip():void {
			
			if(this.stage) {
				stopAttack();
				this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.doMoveShip);
				this.parent.removeChild(this);
			}
			dispatchEvent(new Event(DIE));
		}
		
		protected function doMoveShip(event:MouseEvent):void
		{
			this.x = event.stageX;
			event.updateAfterEvent();
		}
		protected function doFire(event:MouseEvent):void
		{
			
			weapon.fire(HeroWeapon.CANNON, stage, this.x, this.y - 25, this.parent as Player);
			event.updateAfterEvent();
			
		}
	}
}