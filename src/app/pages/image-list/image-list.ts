import { Component } from '@angular/core';
import { ConferenceData } from '../../providers/conference-data';

@Component({
	selector: 'page-image-list',
	templateUrl: 'image-list.html',
	styleUrls: ['./image-list.scss'],
})
export class ImageListPage {
	speakers: any[] = [];

	constructor(public confData: ConferenceData) { }

	ionViewDidEnter() {
		this.confData.getSpeakers().subscribe((speakers: any[]) => {
			this.speakers = speakers;
		});
	}
}
