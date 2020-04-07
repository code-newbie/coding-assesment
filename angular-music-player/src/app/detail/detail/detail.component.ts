import { Component, OnInit, Input } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent implements OnInit {
  @Input() name: string;
  @Input() singer: string;
  @Input() title: string;

  dataForm = new FormGroup({
    name: new FormControl({ value: '' }),
    singer: new FormControl({ value: '' }),
    title: new FormControl({ value: '' })
  });

  constructor() { }

  ngOnInit() {
    this.dataForm.get('name').setValue(this.name);
    this.dataForm.get('singer').setValue(this.singer);
    this.dataForm.get('title').setValue(this.title);

    console.log('hasilnya gimana ', this.dataForm);

  }

}
