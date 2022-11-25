import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="interviews"
export default class extends Controller {
    static targets = ["items", "form"]

  connect() {

  }
}


// <div class="kanban-heading">
//     <strong class="kanban-heading-text">Kanban Board</strong>
//   </div>
//   <div class="kanban-board" data-controller="interviews">
//     <div id="todo" data-insert-in-list-target="items" >To Do</div>
//     <div class="kanban" data-id="<%= @kanban.id %>">


//       <% @kanban.kanban_columns.each do |column| %>
//         <ul class="kanban-col" data-col-id=<%= column.id %> >
//           <li class="kanban-col-name"><%= column.name %></li>
//           <% column.cards.sort_by{ |card| card.position}.each do |item| %>
//             <li class="kanban-col-item" data-item-id=<%= item.id %> >
//               <%= item.content %>
//             </li>
//           <% end %>
//         </ul>
//       <% end %>
//     </div>
//     <div id="inprogress">In Progress</div>
//     <div id="done">Done</div>
//   </div>
