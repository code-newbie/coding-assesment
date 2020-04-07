import { Component, OnInit } from '@angular/core';
import { RobotWrapper } from '../model/robot-wrapper';
// import { RobotWrapper } from '@app/mo';

@Component({
  selector: 'generate-name-app',
  templateUrl: './generate.component.html',
//   styleUrls: [ './app.component.css' ]
})
export class GenerateComponent implements OnInit  {
  name = 'Angular';
  cases: string;
  datas = new Array<RobotWrapper>();
  robotRelease = new Array<RobotWrapper>();
  robotExisting = new Array<string>();
  tempData = new Array<string>();
  jumlah: string;
  activateButton: boolean;
  tombolC: boolean;
  error: string;

  constructor(){}
  ngOnInit(){
    this.tombolC = false;
  }
  //Reset Button when the error happens
  resetID(event) {
      let o = 0;
      this.robotRelease.forEach(x => {
        if(event === o) {
          this.robotRelease[o] = {nama: this.generateName(5), activate: false}
        }
        o++;
      })
      this.robotRelease.forEach(x =>  {
        this.tempData.push(x.nama);
      })
  }
  resetError(){ this.error = ''}
  buttonA() {
    this.resetError();
    this.cases = 'Memproduksi Robot ID yang terdiri dari 2 HURUF uppercase dan 3 Digit Terakhir berupa angka';
    if (!this.jumlah) {
      this.error = ' Tolong diisi jumlah robot yang ingin diproduksi';
    }
    this.robotRelease = this.memberiNama(this.jumlah);
  }
  buttonB(){
    this.cases = 'Apabila terjadi error dan perlu direset dengan ID baru';
    this.resetError();
    this.robotRelease = [
      {nama: 'AB111', activate: false }, 
      {nama: 'WS234', activate: false },
      {nama: 'AB111', activate: true  },
      {nama: 'NA212', activate: false }
    ];
  }
  buttonC(){
    this.tombolC = true;
    this.resetError();
    this.cases = 'Check Duplikasi';
    
    this.robotExisting =  [
      'WW222', 'OP134', 'TT191', 'NA212', 'XX212'
    ];
    
    this.robotRelease = [
      {nama: 'AB111', activate: false }, 
      {nama: 'WS234', activate: false },
      {nama: 'QW123', activate: false },
      {nama: 'NA212', activate: false }
    ];
    this.checkDuplicateName(this.robotRelease);  
  }
  buttonD(){
    this.tombolC = true;
    this.resetError();
    this.cases = 'Menggabungkan semua kasus A, B, dan C';
    if (!this.jumlah) {
      this.error = ' Tolong diisi jumlah robot yang ingin diproduksi';
    }
    this.robotRelease = this.memberiNama(this.jumlah);
    this.checkDuplicateName(this.robotRelease); 
  }

  memberiNama(jumlah) {
    for (let i = 0; i < jumlah; i++) {
      this.datas[i] = {nama: this.generateName(5), activate: false};
      console.log('data loop = ', this.datas);
    }
    console.log('data = ', this.datas);
    
    return this.datas;
  }
  checkDuplicateName(listName) {
      let duplicateArray = false;      
      let indexDuplicate = 0;
      let data = new Array<any>();
      this.injectTempto();
      this.tempData = [];
      //take ID robot
      listName.forEach( x => {
        data.push(x.nama);
      })

      // Check Duplicate ID robot in the same day
      for(let i = 0; i < data.length;i++) {
        // compare the first and last index of an element
        if(data.indexOf(data[i]) !== data.lastIndexOf(data[i])){
            indexDuplicate = data.lastIndexOf(data[i]);
            this.robotRelease[indexDuplicate] = { nama:data[i], activate: true};
            duplicateArray = true;
            // terminate the loop
            break;
        }
      }
      // Check ID duplicate before this production
      if(!duplicateArray) {

        for(let i = 0; i < data.length;i++) {
          // Check ID before this day production
          for (let y of this.robotExisting) {
            if (y === data[i]) {
              console.log('data robot = ', data);
              indexDuplicate = data.indexOf(data[i]);
              this.robotRelease[indexDuplicate] = { nama:data[i], activate: true};
              duplicateArray = true;
              // terminate the loop
              break;
            }
          }
        } 
      }
      if(duplicateArray) {
        
      } else {
        data.forEach( x => {
          this.tempData.push(x);
        })
      }
  }
  injectTempto(){
    this.tempData.forEach(x => {
      this.robotExisting.push(x);
    })
  }
  generateName (length) {
    let result = '';
    let upperCase = '';
    let digit = '';
    let characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let charactersLength = characters.length;

    let digits       = '1234567890';
    let digitsLength = digits.length;

    for ( let i = 0; i < length-3; i++ ) {
      upperCase += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    for ( let i = 0; i < length-2; i++ ) {
      digit += digits.charAt(Math.floor(Math.random() * digitsLength));
    }
    result = upperCase + digit;
    console.log('result ', result);
   return result;
  }
}
