package src.Ships
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import src.Ships.ShipCreator;
	
	internal class Ship extends Sprite
	{
		internal function setLoc(xLoc:int, yLoc:int):void
		{
			this.x = xLoc;
			this.y = yLoc;
		}
		
		internal function drawShip():void{}
		
		internal function initShip():void{}
		
		public function destroyShip():void {}
	}
}