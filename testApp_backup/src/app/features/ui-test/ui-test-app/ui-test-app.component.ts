import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-ui-test-app',
  templateUrl: './ui-test-app.component.html',
  styleUrls: ['./ui-test-app.component.css']
})
export class UiTestAppComponent implements OnInit {

  titleImg: string;

  constructor(
    private router: Router
  ) { }

  ngOnInit() {
  }


  // soal2() {
  //   this.router.navigate([`/arrayTestApp`]);
  // }

  openComponent(title: string) {
    console.log('title', title);

    this.router.navigate([`/uiTestApp/openImage`], { queryParams: { title: title } });
  }

  // openDialog(image: string) {
  //   const param = new Map<string, any>();
  //   param.set('imageTitle', image);
  //   const dialogRef = this.dialog.open(MainComponent, {
  //     width: '250px',
  //     data: {param}
  //   });
  // }
}
