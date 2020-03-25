import {Component, OnInit} from '@angular/core';
import {ITEMS} from './mock-items';
import {Item} from './item';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  title = 'responsive';

  ngOnInit(): void {
  }
}
