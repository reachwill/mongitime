package src.Weapons
{
	internal class AlienCannonBall extends Projectile
	{
		override internal function drawProjectile():void
		{
			graphics.lineStyle(2, 0xFF00FF);
			graphics.drawCircle(0, 0, 5);
		}
		
		override internal function arm():void
		{
			nSpeed = 8;
			nType = Projectile.ALIEN;
		}
		
	}
}