package {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import src.Ships.BlockAliensShips;
	import src.Ships.HeroShip;
	import src.Gamer.Player;

	public class SpaceInvaders extends Sprite
	{
		private var level:Number = 1;
		
		private var aliensBlock:BlockAliensShips;
		
		private var player:Player;
		private var ready:Ready; 
		private var msg:MovieClip;
		
		public function SpaceInvaders()
		{
			super();
			
			trace("Init");
			
			iniciarNivel();
			
			player = new Player();
			player.addEventListener(HeroShip.DIE, playerDieHandler);
			addChild(player);
			player.initGame();
			playerDieHandler();
			
			
		}
		private function playerDieHandler(event:Event = null):void {
			aliensBlock.attackMode = false;
			
			ready = new Ready();
			ready.x = stage.stageWidth / 2;
			ready.y = stage.stageHeight / 2;
			addChild(ready);
			
			var tmr:Timer = new Timer(4000, 1);
			tmr.addEventListener(TimerEvent.TIMER, delayAttackHero);
			tmr.start();
		}
		private function delayAttackHero(event:TimerEvent):void {
			removeChild(ready);
			player.attackMode = true;
			aliensBlock.attackMode = true;
		}
		private function iniciarNivel():void {
			aliensBlock = new BlockAliensShips(this.level);
			aliensBlock.addEventListener(BlockAliensShips.KILLED_ALL_ALIENS, levelCompleted);
			addChild(aliensBlock);
			
			mostrarMensajeNivel();
		}
		
		private function mostrarMensajeNivel():void 
		{
			/**
			 * muestro el mensaje con el nivel
			 */
			msg = new levelMsg();
			var tf:TextField = msg.getChildByName("msg") as TextField;
			tf.text = "Level " + this.level;
			msg.x = stage.stageWidth / 2;
			msg.y = stage.stageHeight / 2;
			addChild(msg);
			/**
			 * meto un timer para ocultar el mensajito
			 */
			var tmr:Timer = new Timer(1500, 1);
			tmr.addEventListener(TimerEvent.TIMER, ocultarMensajeNivel);
			tmr.start();
		}
		
		private function ocultarMensajeNivel(e:TimerEvent):void
		{
			removeChild(msg);
		}
		
		private function levelCompleted(event:Event):void {
			var tmr:Timer = new Timer(2000, 1);
			tmr.addEventListener(TimerEvent.TIMER, ocultarVictoria);
			mostrarVictoria();
			tmr.start();
			level++; 
		}
		
		private function ocultarVictoria(e:TimerEvent):void 
		{
			trace("OCULTOVICTORIA");
			removeChild(msg);
			iniciarNivel();
		}
		
		private function mostrarVictoria():void {
			msg = new Win();
			msg.x = stage.stageWidth / 2;
			msg.y = stage.stageHeight / 2;
			addChild(msg);
		}
	}
}
