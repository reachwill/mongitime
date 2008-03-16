package src.Weapons
{
	import flash.events.Event;
	
	internal class AlienMine extends Projectile
	{
		override internal function drawProjectile():void
		{
			graphics.lineStyle(2, 0xFF0000);
			graphics.drawRect(-5, -5, 10, 10);
		}
		
		override internal function arm():void
		{
			nSpeed = 2;
			nType = Projectile.ALIEN;
		}
		override internal function doMoveProjectile(event:Event):void
		{
			super.doMoveProjectile(event);
			this.rotation += 5;
		}
	}
}