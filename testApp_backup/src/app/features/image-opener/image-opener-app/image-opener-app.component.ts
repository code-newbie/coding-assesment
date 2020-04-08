import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-image-opener-app',
  templateUrl: './image-opener-app.component.html',
  styleUrls: ['./image-opener-app.component.css']
})
export class ImageOpenerAppComponent implements OnInit {

  parameterMap: any;

  // ngIf
  civilWar = false;
  doctorStrange = false;
  fantasticFour = false;
  guardians = false;
  hulk = false;
  intoTheSpiderVerse = false;
  spiderMan2 = false;
  theAvengers = false;
  thor = false;

  constructor(
    private route: ActivatedRoute,
    ) { }

  ngOnInit() {
    this.getActiveRouteparams()
    this.setNgIf();
  }

  getActiveRouteparams() {
    this.route.queryParams.subscribe(param => {
      this.parameterMap = param;
    });
  }

  setNgIf() {
    if (this.parameterMap.title === 'civil_war') {
      this.civilWar = true;
    } else if (this.parameterMap.title === 'doctor_strange') {
      this.doctorStrange = true;
    } else if (this.parameterMap.title === 'fantastic_four') {
      this.fantasticFour = true;
    } else if (this.parameterMap.title === 'guardians_of_the_galaxy') {
      this.guardians = true;
    } else if (this.parameterMap.title === 'hulk') {
      this.hulk = true;
    } else if (this.parameterMap.title === 'into_the_spider_verse') {
      this.intoTheSpiderVerse = true;
    } else if (this.parameterMap.title === 'spider_man_2') {
      this.spiderMan2 = true;
    } else if (this.parameterMap.title === 'the_avengers') {
      this.theAvengers = true;
    } else if (this.parameterMap.title === 'thor') {
      this.thor = true;
    }
  }


}
