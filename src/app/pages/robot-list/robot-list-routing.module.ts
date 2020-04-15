import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RobotListPage } from './robot-list';
const routes: Routes = [
	{
		path: '',
		component: RobotListPage
	}
];

@NgModule({
	imports: [RouterModule.forChild(routes)],
	exports: [RouterModule]
})
export class RobotListPageRoutingModule { }
