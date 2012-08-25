$ ->
  $('div.actions :first').click ->
    total_number_input_field = $('div.field:last').children().length - 1
    $('div.field:last').append('
      <p>
        <label for="project_file_projects_attributes_'+total_number_input_field+'_name">Name</label>
        <input id="project_file_projects_attributes_'+total_number_input_field+'_name" type="text" size="30" name="project[file_projects_attributes]['+total_number_input_field+'][name]">
        <label for="project_file_projects_attributes_'+total_number_input_field+'_file">File</label>
        <input id="project_file_projects_attributes_'+total_number_input_field+'_file" type="file" name="project[file_projects_attributes]['+total_number_input_field+'][file]">
        <input type="hidden" value="'+total_number_input_field+'" name="project[file_projects_attributes]['+total_number_input_field+'][remove_file]">
        <input id="project_file_projects_attributes_'+total_number_input_field+'_remove_file" type="checkbox" value="1" name="project[file_projects_attributes]['+total_number_input_field+'][remove_file]">
        <label for="project_file_projects_attributes_'+total_number_input_field+'_remove_file">Remove file</label>
      </p>
    ')
