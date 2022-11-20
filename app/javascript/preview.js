if (document.URL.match(/image/) || document.URL.match(/confirm/)) {
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML_main = (blob) => {
      const imageElement = document.getElementById('new-image_main');
      const old_main_img = document.getElementById("old_main_img");
      if (old_main_img){
        old_main_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-main')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_main').addEventListener('change', (e) =>{
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
      const old_sub1_img = document.getElementById("old_sub1_img");
      if (old_sub1_img){
        old_sub1_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub1')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_sub1').addEventListener('change', (e) =>{
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
      const old_sub2_img = document.getElementById("old_sub2_img");
      if (old_sub2_img){
        old_sub2_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub2')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_sub2').addEventListener('change', (e) =>{
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
      const old_sub3_img = document.getElementById("old_sub3_img");
      if (old_sub3_img){
        old_sub3_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub3')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_sub3').addEventListener('change', (e) =>{
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
      const old_sub4_img = document.getElementById("old_sub4_img");
      if (old_sub4_img){
        old_sub4_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub4')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_sub4').addEventListener('change', (e) =>{
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
      const old_sub5_img = document.getElementById("old_sub5_img");
      if (old_sub5_img){
        old_sub5_img.remove();
      }
      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img-sub5')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('bathhouse_bathhouse_image_sub5').addEventListener('change', (e) =>{
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



if (document.URL.match(/review_new/)) {
  document.addEventListener('DOMContentLoaded', () => {
    const createImageHTML_image = (blob) => {
      const imageElement = document.getElementById('new-image');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('id', 'new-img')
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
    };

    document.getElementById('review_image').addEventListener('change', (e) =>{
      const imageContent = document.getElementById('new-img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML_image(blob);
    });
  });
}