package src.Weapons
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import src.Gamer.Player;
	import src.Ships.ShipCreator;
	
	internal class Projectile extends Sprite
	{
		public static const BALA_DESTRUIDA:String = "BALA_IDA";
		
		public static const ALIEN:uint = 0;
		public static const HERO:uint = 1;

		private var playerOwner:Player;
		
		internal var nSpeed:Number;
		internal var nType:int;
		
		internal function drawProjectile():void{}
		
		internal function arm():void
		{
			nSpeed = 5;
		}
		
		public function set owner(owner:Player):void {
			if (owner != null) {
				playerOwner = owner;
			}
			else {
				throw new Error("owner must be != null");
			}
		}
		
		public function get owner():Player {
			if (playerOwner) {
				return playerOwner;
			}
			else {
				return null;
			}
		}
		
		internal function release():void
		{
			this.addEventListener(Event.ENTER_FRAME, this.doMoveProjectile);
		}
		
		internal function setLoc(xLoc:int, yLoc:int):void
		{
			this.x = xLoc;
			this.y = yLoc;
			
		}
		
		internal function doMoveProjectile(event:Event):void
		{
			this.y +=nSpeed;
			hitCheck();
			if(this.stage) {
				if ((this.y < 0) || (this.y > this.parent.stage.stageHeight))
				{
					this.removeEventListener(Event.ENTER_FRAME, this.doMoveProjectile);
					//if(this.parent.getChildIndex(this)) {
						this.parent.removeChild(this);
						if(this.nType == HERO) {
							dispatchEvent(new Event(BALA_DESTRUIDA));
						}
					//}
				}
			}
		}
		internal function hitCheck():void {
			if(this.nType == HERO) {
				for(var i:String in ShipCreator.alienShips) {
				
					if(this.hitTestObject(ShipCreator.alienShips[i])) {
						
						this.removeEventListener(Event.ENTER_FRAME, this.doMoveProjectile);
						
						if(this.parent && this.parent.getChildIndex(this)) {
							this.parent.removeChild(this);
							
						}
						if(owner) {
							owner.addKill();
						}
						ShipCreator.alienShips[i].destroyShip();
						ShipCreator.removeShip(ShipCreator.alienShips[i]);
						dispatchEvent(new Event(BALA_DESTRUIDA));
						break;
						
					}
				}
				
			} else if (this.nType == ALIEN) {
				for(i in ShipCreator.heroShips) {
				
					if(this.hitTestObject(ShipCreator.heroShips[i])) {
						
						this.removeEventListener(Event.ENTER_FRAME, this.doMoveProjectile);
						
						if(this.parent && this.parent.getChildIndex(this)) {
							this.parent.removeChild(this);
						}
						ShipCreator.heroShips[i].destroyShip();
						ShipCreator.removeShip(ShipCreator.heroShips[i]);
						break;
						
					}
				}

			}
		}
	}
}