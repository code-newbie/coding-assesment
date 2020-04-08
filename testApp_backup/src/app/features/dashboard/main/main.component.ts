import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {

  constructor(
    private router: Router
  ) { }

  ngOnInit() {
  }

  soal1() {
    this.router.navigate([`/uiTestApp`]);
  }

  soal2() {
    this.router.navigate([`/arrayTestApp`]);
  }

}
