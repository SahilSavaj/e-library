console.log(url)
// Loaded via <script> tag, create shortcut to access PDF.js exports.
let pdfjsLib = window['pdfjs-dist/build/pdf'];


s3_url="https://online-library-neo.s3.ap-south-1.amazonaws.com/pdfs/"+url
// The workerSrc property shall be specified.
pdfjsLib.GlobalWorkerOptions.workerSrc = '../static/pdf.worker.js';

let pdfDoc = null,
    pageNum = 1,
    pageRendering = false,
    pageNumPending = null,
    scale = 1

    
/**
 * Get page info from document, resize canvas accordingly, and render page.
 * @param num Page number.
 */
function renderPage(num) {
  pageRendering = true;
  // Using promise to fetch the page
  
  if (num<=pdfDoc.numPages ){
    console.log(num);
    pdfDoc.getPage(num).then(function(page) {
    canvas = document.getElementById('the-canvas'),
    ctx = canvas.getContext('2d');
    let h=page.view[3];
    let w=page.view[2];
    console.log(w,h)
    // scale=Math.min(800/w,600/h)
    // scale=Math.min(800,600)
    let viewport = page.getViewport({scale:scale});
    // canvas.height=h;
    // canvas.width=w;
    canvas.height = viewport.height;
    canvas.width = viewport.width;
    //console.log(canvas.height);
    //console.log(canvas.width);
    

    // Render PDF page into canvas context
    let renderContext = {
      canvasContext: ctx,
      viewport: viewport
    };
    
    let renderTask = page.render(renderContext);
   ;

    // Wait for rendering to finish
    renderTask.promise.then(function() {
      pageRendering = false;
      if (pageNumPending !== null) {
        // New page rendering is pending
        renderPage(pageNumPending);
        pageNumPending = null;
      }
    });
  });
}
else if(num>pdfDoc.numPages){
  document.getElementById('box').innerHTML='<canvas id="the-canvas" class="the-canvas" style="direction: ltr;"></canvas>';
}

  if (num+1<=pdfDoc.numPages){
    pdfDoc.getPage(num).then(function(page) {
        canvas1 = document.getElementById('the-canvas1'),
        ctx1=canvas1.getContext('2d');
        let w1=page.view[3];
        let h1=page.view[2];
        //console.log(w1,h1)
        // scale=Math.min(800/w1,600/h1)
        let viewport1 = page.getViewport({scale: scale});
        canvas1.height = viewport1.height;
        canvas1.width = viewport1.width;
        // canvas1.height=800;
        // canvas1.width=600;
    
        // Render PDF page into canvas context
        
        let renderContext1 = {
            canvasContext: ctx1,
            viewport: viewport1
          };
        
        let renderTask1 = page.render(renderContext1);
        renderTask1.promise.then(function() {
            pageRendering = false;
            if (pageNumPending !== null) {
              // New page rendering is pending
              renderPage(pageNumPending);
              pageNumPending = null;
            }
          });
      });
    }
    else if(num+1>pdfDoc.numPages){
        document.getElementById('box1').innerHTML='<canvas id="the-canvas1" class="the-canvas" style="direction: ltr;"></canvas>';
    }
  
  // Update page counters
  if (num<pdfDoc.numPages){
    document.getElementById('page_num').textContent = String(num)+", "+String(num+1);
  }
  else{
    document.getElementById('page_num').textContent = String(num);
  }
  
}

/**
 * If another page rendering in progress, waits until the rendering is
 * finised. Otherwise, executes rendering immediately.
 */
function queueRenderPage(num) {
  if (pageRendering) {
    pageNumPending = num;
  } else {
    renderPage(num);
  }
}

/**
 * Displays previous page.
 */
function onPrevPage() {
  if (pageNum-1 <= 1) {
    return;
  }
  pageNum-=2;
  queueRenderPage(pageNum);
}
document.getElementById('prev').addEventListener('click', onPrevPage);

/**
 * Displays next page.
 */
function onNextPage() {
  if (pageNum+1 >= pdfDoc.numPages) {
    return;
  }
  pageNum+=2;
  queueRenderPage(pageNum);
}
document.getElementById('next').addEventListener('click', onNextPage);


/**
 * Asynchronously downloads PDF.
 */

  pdfjsLib.getDocument(s3_url).promise.then(function(pdfDoc_) {
  pdfDoc = pdfDoc_;
  document.getElementById('page_count').textContent = pdfDoc.numPages;

  // Initial/first page rendering
  renderPage(pageNum);

  }
  );








    