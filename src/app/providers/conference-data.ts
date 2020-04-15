import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { of } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
	providedIn: 'root'
})
export class ConferenceData {
	data: any;

	constructor(public http: HttpClient) { }

	load(): any {
		if (this.data) {
			return of(this.data);
		} else {
			return this.http
				.get('assets/data/data.json')
				.pipe(map(this.processData, this));
		}
	}

	processData(data: any) {
		this.data = data;
		this.data.schedule.forEach((day: any) => {
			day.groups.forEach((group: any) => {
				group.sessions.forEach((session: any) => {
					session.speakers = [];
					if (session.speakerNames) {
						session.speakerNames.forEach((speakerName: any) => {
							const speaker = this.data.speakers.find(
								(s: any) => s.name === speakerName
							);
							if (speaker) {
								session.speakers.push(speaker);
								speaker.sessions = speaker.sessions || [];
								speaker.sessions.push(session);
							}
						});
					}
				});
			});
		});
		return this.data;
	}

	getSpeakers() {
		return this.http.get('assets/data/data.json').pipe(map((data: any) => {
			return data['speakers'];
		}));
	}

	getTracks() {
		return this.load().pipe(
			map((data: any) => {
				return data.tracks.sort();
			})
		);
	}

	getMap() {
		return this.load().pipe(
			map((data: any) => {
				return data.map;
			})
		);
	}
}
