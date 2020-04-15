import { Component } from '@angular/core';
import { ConferenceData } from '../../providers/conference-data';
import { AlertController } from '@ionic/angular';
import { RobotService } from '../../providers/robot-service';

@Component({
	selector: 'page-robot-list',
	templateUrl: 'robot-list.html',
	styleUrls: ['./robot-list.scss'],
})
export class RobotListPage {
	robots: any[] = [
		{name:'RX837',flgError:'N'},
		{name:'BC811',flgError:'N'},
	];

	constructor(
		public confData: ConferenceData,
		public alertCtrl: AlertController,
		public robotService: RobotService,
		) { }

	ionViewDidEnter() {

	}

	async produceRobot(){

		let alert = await this.alertCtrl.create({
			header: 'Produce',
			message: `How many robot do you want to produce today?`,
			inputs: [
				{
					name: 'numberRobot',
					type: 'number',
					min: 1,
					max: 1000
				  },
			],
			buttons: [
				{
					text: 'Batal',
					role: 'cancel',
				},
				{
					text: 'Ok',
					handler: (input) => {
						if(input.numberRobot){
							this.generateRobot(input.numberRobot);
						}
					}
				}
			]
		});
		await alert.present();

	}

	generateRobot(numberRobot:number){
		for(let i =0; i<numberRobot; i++){
			let robotName = this.robotService.generateRobotName(this.robots);
			this.robots.push({name:robotName,flgError:'N'});
		}
	}

	markRobotError(index:number){
		let robotName = this.robotService.generateRobotName(this.robots);
		this.robots[index]['name'] = robotName;
	}

}
