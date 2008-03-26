package src.Weapons
{
	import flash.display.Stage;
	import flash.display.DisplayObjectContainer ;
	import flash.errors.IllegalOperationError;
	
	import src.Gamer.Player;
	
	public class Weapon
	{
		public static var viewProjectiles:Array = new Array();
		
		public static var target:DisplayObjectContainer;
		
		public function fire(cWeapon:uint, target:DisplayObjectContainer, xLoc:int, yLoc:int, owner:Player = null):void
		{
			Weapon.target = target;
			
			var projectile:Projectile = this.createProjectile(cWeapon);
			
			if(owner) projectile.owner = owner;
			//trace("Disparando" + projectile.toString());
			projectile.drawProjectile();
			
			projectile.setLoc(xLoc, yLoc);
			
			projectile.arm();
			viewProjectiles.push(projectile);
			if(target)
				target.addChild(projectile);
			
			projectile.release();
		}
		
		protected function createProjectile(cWeapon:uint):Projectile
		{
			throw new IllegalOperationError("Acstract methos: must be overrideden");
			return null;
		}
		
		public static function removeAllProjectiles():void {
			for (var index:String in viewProjectiles) {
				if (Weapon.target.contains(viewProjectiles[index]))
					Weapon.target.removeChild(viewProjectiles[index]);
			}
			viewProjectiles = new Array();
		}
	}
}