import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-dataimage',
  templateUrl: './data-image.component.html',
  styleUrls: ['./data-image.component.css']
})
export class DataImageComponent implements OnInit {


  public userForm: FormGroup = null;

  constructor() {
  }

  ngOnInit(){
  }


}
