import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ConferenceData } from '../../providers/conference-data';

@Component({
	selector: 'page-image-detail',
	templateUrl: 'image-detail.html',
	styleUrls: ['./image-detail.scss'],
})
export class ImageDetailPage {
	speaker: any;

	constructor(
		private dataProvider: ConferenceData,
		private route: ActivatedRoute,
		public confData: ConferenceData,
	) { }

	ionViewWillEnter() {
		this.dataProvider.load().subscribe((data: any) => {
			const imageId = this.route.snapshot.paramMap.get('imageId');
			if (data && data.speakers) {
				for (const speaker of data.speakers) {
					if (speaker && speaker.id === imageId) {
						this.speaker = speaker;
						break;
					}
				}
			}
		});
	}
}
