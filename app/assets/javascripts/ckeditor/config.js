if (typeof(CKEDITOR) != 'undefined') {
    CKEDITOR.editorConfig = function( config )
    {
    config.height = '60vh';
    config.width = '100%'; 
    config.enterMode = CKEDITOR.ENTER_P;
    config.shiftEnterMode = CKEDITOR.ENTER_BR;
    config.autoParagraph = false;
  }
}