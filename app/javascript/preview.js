if (document.URL.match(/image/) || document.URL.match(/confirm/)) {
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML_main = (blob) => {
      const imageElement = document.getElementById('new-image_main');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-main')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_main').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-main');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_main(blob);
    });


      const createImageHTML_sub1 = (blob) => {
      const imageElement = document.getElementById('new-image_sub1');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub1')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_sub1').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-sub1');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_sub1(blob);
    });


      const createImageHTML_sub2 = (blob) => {
      const imageElement = document.getElementById('new-image_sub2');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub2')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_sub2').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-sub2');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_sub2(blob);
    });


      const createImageHTML_sub3 = (blob) => {
      const imageElement = document.getElementById('new-image_sub3');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub3')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_sub3').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-sub3');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_sub3(blob);
    });

      const createImageHTML_sub4 = (blob) => {
      const imageElement = document.getElementById('new-image_sub4');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub4')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_sub4').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-sub4');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_sub4(blob);
    });


      const createImageHTML_sub5 = (blob) => {
      const imageElement = document.getElementById('new-image_sub5');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub5')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_image_sub5').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img-sub5');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_sub5(blob);
    });
  });
}