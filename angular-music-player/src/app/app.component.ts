import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  dataForm = new FormGroup({
    name: new FormControl({ value: '' }),
    singer: new FormControl({ value: '' }),
    title: new FormControl({ value: '' })
  });

  imgName1: any[];
  imgName2: any[];
  select: boolean;
  name: string;
  singer: string;
  title: string;

  ngOnInit() {
    this.imgName1 = [
      { name: 'image1.jpg', singer: 'Maroon 5', title: 'Memories' },
      { name: 'image2.jpg', singer: 'Taylor Swift', title: 'Lover' },
      { name: 'image3.jpg', singer: 'Coldplay', title: 'Parachutes' },
      { name: 'image4.jpg', singer: 'Lauv', title: 'I Like Me Better' },
      {
        name: 'image5.jpg',
        singer: 'Lady Gaga',
        title: 'I`ll Never Love Again'
      }
    ];
    this.imgName2 = [
      { name: 'image6.jpg', singer: 'Honne', title: 'Location Unknown' },
      {
        name: 'image7.jpg',
        singer: 'Selena Gomez',
        title: 'Lose You To Love Me'
      },
      { name: 'image8.jpg', singer: 'Justin Bieber', title: 'Yummy' },
      {
        name: 'image9.jpg',
        singer: 'Avrile Lavigne',
        title: 'Head Above Water'
      },
      { name: 'image10.jpg', singer: 'Adele', title: 'Hello' }
    ];
  }

  onClick(event) {
    console.log('show nya ', event);
    this.name = event.name;
    this.singer = event.singer;
    this.title = event.title;

    this.select = true;
  }
}
