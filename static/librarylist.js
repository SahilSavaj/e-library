
let path="/static/";

let thumb_pdf="/static/physics-thumb.jpg"
let pdf='';
// let click='';
let terms='not-agreed'


function renderPdf(data){
    cnt=0
    data.forEach(function(pdfs){
        link_to_pdf=pdfs.pdf.replace('/static','');
        name_of_pdf=pdfs.title
        if(name_of_pdf.length>18){
            name_of_pdf=name_of_pdf.slice(0,18)+'..'
        }
        cnt+=1
        pdf+='<div class="col" >'+
            '<div class="row" >'+
            '<div class="card" style="height:280px; width:240px;">'+
            //'<a href='+path+url+'>'+
            //href="/pdfviewer"
            // onclick="Load('`+link_to_pdf+`')"
            `<a id="open-link" href="/pdfviewer?url=`+link_to_pdf+`&terms=`+terms+`" >`+
                '<img class="card-img-top" style="height:210px;" src='+thumb_pdf+'>'+
            '</a>'+
            '<div class="card-body">'+
                '<h8 class="card-title">'+name_of_pdf+'</h8>'+
                '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
        
        document.getElementById('pdfCardImg').innerHTML=pdf;

    })
    if (cnt%5!=0){
        
        pdf+=('<div class="col" >'+
        '<div class="row" >'+
        '</div>'+
        '</div>').repeat(5-(cnt%5))
        document.getElementById('pdfCardImg').innerHTML=pdf;
    }
}
 






