﻿package src.Gamer {
	
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import src.Ships.HeroShip;
	import src.Ships.ShipCreator;
	
	
	public class Player extends Sprite {
		
		/**
		 * Vidas restantes
		 */
		public var lifes:int = 5;
		/**
		 * Naves destruidas
		 */
		public var kills:int = 0;
		/**
		 * Puntaje
		 */
		public var score:Number = 0;
		
		protected var _attackMode:Boolean = false; 
		
		
		
		
		private var shipFactory:ShipCreator;
		private var shipReference:HeroShip;
		private var target:DisplayObjectContainer;
		
		private var scoreField:TextField;
		private var lifesField:TextField;
		
		public function Player() {
			super();
			
			shipFactory = new ShipCreator();
			
			createScoreBar();
			
		}
		private function createScoreBar():void {
			var format:TextFormat = new TextFormat("Verdana", 15, 0xCCCCCC, true);
			
			scoreField = new TextField();
			scoreField.width = 100;
			scoreField.selectable = false;
			scoreField.height = 20;
			scoreField.defaultTextFormat = format;
			scoreField.text = "0";
			addChild(scoreField);
			
			lifesField = new TextField();
			lifesField.width = 100;
			lifesField.selectable = false;
			lifesField.height = 20;
			lifesField.defaultTextFormat = format;
			lifesField.text = "Lifes: " + lifes;
			lifesField.x = 700;
			addChild(lifesField);
			
			
			
		}
		public function initGame():void {
			newShip();
		}
		
		private function newShip():void {
			shipReference = shipFactory.addShip(ShipCreator.HERO, this, 390, 580) as HeroShip;
			shipReference.addEventListener(HeroShip.DIE, playerDieHandler);
			
		}
		public function set attackMode(value:Boolean):void {
			if (value && shipReference != null) {
				_attackMode = true;
				shipReference.startAttack();
			} else if (!value && shipReference != null) {
				_attackMode = false;
				shipReference.stopAttack();
			}
			
		}
		private function playerDieHandler(event:Event):void {
			
			lifes--;
			if(lifes < 0) {
				lifesField.text = "Game Over";
				return;
			}
			lifesField.text = "Lifes: " + lifes;
			shipReference.removeEventListener(HeroShip.DIE, playerDieHandler);
			shipReference = null;
			newShip();
			dispatchEvent(event);
		}
		public function addKill():void {
			kills++;
			scoreField.text = new String(kills * 100);
			//trace(kills);
		}
	}
}