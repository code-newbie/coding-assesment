import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
	{
		path: '',
		redirectTo: '/image-list',
		pathMatch: 'full'
	},
	{
		path: 'robot-list',
		loadChildren: () => import('./pages/robot-list/robot-list.module').then(m => m.RobotListModule)
	},
	{
		path: 'image-list',
		loadChildren: () => import('./pages/image-list/image-list.module').then(m => m.ImageListModule)
	},
	{
		path: 'image-detail/:imageId',
		loadChildren: () => import('./pages/image-detail/image-detail.module').then(m => m.ImageDetailModule)
	},
];

@NgModule({
	imports: [RouterModule.forRoot(routes)],
	exports: [RouterModule]
})
export class AppRoutingModule { }
