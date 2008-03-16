package src.Weapons
{
	import flash.errors.IllegalOperationError;
	
	public class AlienWeapon extends Weapon
	{
		public static const CANNON:uint = 0;
		public static const MINE:uint = 1;
		
		override protected function createProjectile(cWeapon:uint):Projectile
		{
			if(cWeapon == CANNON) {
				//trace("creando new alien CannonBall");
				return new AlienCannonBall();
			}else if (cWeapon == MINE) {
				//trace("Creando new alien mine");
				return new AlienMine();
			} else {
				throw new IllegalOperationError("Acstract methos: must be overrideden");
				return null;
			}
			
		}
	}
}