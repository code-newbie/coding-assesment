import {Component, Input, OnInit} from '@angular/core';
import {Item} from '../../item';
import {ActivatedRoute, Params} from '@angular/router';
import {ItemService} from '../../item.service';
import { switchMap } from 'rxjs/operators';


@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.scss']
})
export class DetailComponent implements OnInit {
  item: Item = new Item();
  constructor(private route: ActivatedRoute, private itemService: ItemService) { }

  ngOnInit(): void {
    this.route.params.pipe(
      switchMap((params: Params) => this.itemService.getItem(+params.id))
    ).subscribe(item => this.item = item);
    console.log(this.item);
  }
}
