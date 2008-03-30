package src.Weapons
{
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	
	
	public class HeroWeapon extends Weapon
	{
		
		public static const CANNON:uint = 0;
		
		public var heroShootInAir:Boolean = false; 
		
		override protected function createProjectile(cWeapon:uint):Projectile
		{
			if(!heroShootInAir && cWeapon == CANNON) {
				//trace("creando new hero CannonBall");
				heroShootInAir = true;
				
				var heroProjectile:HeroCannonBall = new HeroCannonBall(); 
				heroProjectile.addEventListener(Projectile.BALA_DESTRUIDA, balaPerdidaHandler);
				return heroProjectile;
			}else {
				throw new IllegalOperationError("Acstract methos: must be overrideden");
				return null;
			}
		}
		private function balaPerdidaHandler(event:Event):void {
			//trace("balaPerdida: " + event);
			heroShootInAir = false;
		}
	}
}