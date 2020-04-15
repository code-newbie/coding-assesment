import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';

import { RobotListPage } from './robot-list';
import { RobotListPageRoutingModule } from './robot-list-routing.module';

@NgModule({
	imports: [
		CommonModule,
		IonicModule,
		RobotListPageRoutingModule
	],
	declarations: [RobotListPage],
})
export class RobotListModule { }
