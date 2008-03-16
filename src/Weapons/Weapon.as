package src.Weapons
{
	import flash.display.Stage;
	import flash.display.DisplayObjectContainer ;
	import flash.errors.IllegalOperationError;
	
	public class Weapon
	{
		public function fire(cWeapon:uint, target:DisplayObjectContainer, xLoc:int, yLoc:int):void
		{
			var projectile:Projectile = this.createProjectile(cWeapon);
			//trace("Disparando" + projectile.toString());
			projectile.drawProjectile();
			
			projectile.setLoc(xLoc, yLoc);
			
			projectile.arm();
			
			if(target)
				target.addChild(projectile);
			
			projectile.release();
		}
		
		protected function createProjectile(cWeapon:uint):Projectile
		{
			throw new IllegalOperationError("Acstract methos: must be overrideden");
			return null;
		}
	}
}