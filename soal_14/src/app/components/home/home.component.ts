import {Component, Input, OnInit} from '@angular/core';
import {ITEMS} from '../../mock-items';
import {Item} from '../../item';
import {Router} from '@angular/router';
import {ItemService} from '../../item.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  items: Item[];
  selectedItem: Item;

  constructor(private router: Router, private itemService: ItemService) {}
  ngOnInit(): void {
    this.getItems();
  }

  onSelect(item: Item): void {
    this.selectedItem = item;
    console.log(item);
    this.navigate(item);
  }

  getItems(): void {
    this.itemService.getItems().then(items => this.items = items);
  }

  navigate(item) {
    this.router.navigate([`item/${this.selectedItem.id}`]);
  }

}
