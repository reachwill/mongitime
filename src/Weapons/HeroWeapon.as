package src.Weapons
{
	import flash.errors.IllegalOperationError;
	
	
	public class HeroWeapon extends Weapon
	{
		
		public static const CANNON:uint = 0;
		
		override protected function createProjectile(cWeapon:uint):Projectile
		{
			if(cWeapon == CANNON) {
				//trace("creando new hero CannonBall");
				return new HeroCannonBall();
			}else {
				throw new IllegalOperationError("Acstract methos: must be overrideden");
				return null;
			}
		}
	}
}