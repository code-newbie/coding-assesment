import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ImageListPage } from './image-list';
const routes: Routes = [
	{
		path: '',
		component: ImageListPage
	}
];

@NgModule({
	imports: [RouterModule.forChild(routes)],
	exports: [RouterModule]
})
export class ImageListPageRoutingModule { }
