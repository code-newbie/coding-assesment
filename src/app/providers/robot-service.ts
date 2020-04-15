import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage';


@Injectable({
	providedIn: 'root'
})
export class RobotService {

	constructor(
		public storage: Storage
	) { }

	generateRobotName=(robotList:any):string=>{
		let alphStr:string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		let robotName:string = '';

		let robotNameExists = [];

		do {

			for(let i=0; i<2; i++){
				robotName = robotName+alphStr.charAt(this.getRandomIntegerAlphabet());
			}
			for(let i=0; i<3; i++){
				robotName = robotName+this.getRandomInteger();
			}

			robotNameExists = robotList.filter((el,index,arr)=>{
				return (el.name==robotName);
			});
		} while (robotNameExists.length>0);


		return robotName;
	}

	getRandomIntegerAlphabet=():number=>{
		return 1 + Math.floor((26 - 1) * Math.random());
	}

	getRandomInteger=():number=>{
		return Math.floor(9 * Math.random());
	}
}
