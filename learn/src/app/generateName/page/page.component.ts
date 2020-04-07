import { Component, OnInit } from '@angular/core';
import { UIWrapper } from '../model/ui-wrapper';
import { Router, ActivatedRoute } from '@angular/router';
// import {} from '@angular/mater'

@Component({
  selector: 'page-component-app',
  templateUrl: './page.component.html',
  styleUrls: [ './page.component.css' ]
})
export class PageComponent implements OnInit  {

    alamatImg = new Array<UIWrapper>() ;
    state: any;
    album: string;
    artis: string;
    url: string;

    constructor(private route: ActivatedRoute, router: Router){
    }
    
    ngOnInit(){
        this.state = this.route.paramMap
        .subscribe(x => {
            this.album = x.get('album');
            this.artis = x.get('artis');
            this.url = x.get('url');
        });
        console.log('data ', this.album, this.url, this.artis);
    }

}
