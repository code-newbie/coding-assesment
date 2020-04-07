import { Component, OnInit } from '@angular/core';
import { UIWrapper } from '../model/ui-wrapper';
import { ActivatedRoute, Router } from '@angular/router';
// import {} from '@angular/mater'

@Component({
  selector: 'ui-component-app',
  templateUrl: './ui.component.html',
  styleUrls: [ './ui.component.css' ]
})
export class UIComponent implements OnInit  {

    alamatImg = new Array<UIWrapper>() ;
    currentUri: string;
    currentUrl: string;
    constructor(
        public route: ActivatedRoute,
        public router: Router
        ){
            this.currentUri = this.router.url;
            this.currentUrl = this.router.url.split('?')[0];
        }
    
    ngOnInit(){
        this.alamatImg = [
            { url: 'https://upload.wikimedia.org/wikipedia/en/e/e8/Taylor_Swift_-_Red.png', artis: 'Taylor Swift', album: 'Kenangan Mantan'},
            { url: 'https://i1.wp.com/dailytrojan.com/wp-content/uploads/2017/01/edsheeran-album.jpg?fit=500%2C500', artis: 'Ed Sheeran', album: 'Nelangsa'},
            { url: 'https://upload.wikimedia.org/wikipedia/en/a/a9/Charlie_Puth_-_Dangerously_%28Official_song_cover%29.jpg', artis: 'Charlie Puth', album: 'Galau Urip'},
            { url: 'https://e.snmc.io/i/300/w/3ccc57d53c837662eab76634120240c4/1340432', artis: ' Mcfly ', album: 'Urip Enom'},
            { url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXGjJYRInKtsKTulMcHhgXjcC3kEREl-uDjdhSk6a2IHgRNgvh&s', artis: 'NeedtoBreathe', album: 'Konco kentel'},
            { url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGO7uFjL8lPvzQDUCrphRVv_cVj6IyVOl4hexVYpDWYO23XlpSPA&s', artis: 'Justin Timberlake', album: 'S.A.N.T.U.Y'},
            { url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY2n1UnBaPu-fWCXBPtJrgOuYQybzNLtoJI_w-MNZ_UTbJj1y2&s', artis: 'Ronan Keating', album: 'Aku ora popo'},
            { url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6F5-AQSkfzb0H9F25BJkMw1GEBon_8RVek4Cw5T_1QrGbXcjoJQ&s', artis: 'The Script', album: 'AMBYAR'},
            
        ]
    }

    onClickImg(event) {
        console.log('current Form = ', this.currentUrl);
        this.router.navigate([ this.currentUrl +'/view', { album: event.album , url: event.url, artis: event.artis }]);
    }
}
