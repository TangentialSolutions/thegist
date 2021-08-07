class Thegist
  module View
    class AppView
      class GistFetch
        include Gist
        include Gisty
        attr_accessor :gists, :gists_options

        def initialize
          self.gists_options = list_all_gists :tangentus
          reset_gists!
        end

        def reset_gists!
          self.gists = ['Quebec', 'Manitoba', 'Alberta']
        end
      end

      include Glimmer::UI::CustomShell
    
      ## Add options like the following to configure CustomShell by outside consumers
      #
      # options :title, :background_color
      # option :width, default: 320
      # option :height, default: 240
      option :greeting, default: 'Hello, World!'
  
      ## Use before_body block to pre-initialize variables to use in body
      #
      #
      before_body do
        Display.app_name = 'Thegist'
        Display.app_version = VERSION
        @display = display {
          on_about {
            display_about_dialog
          }
          on_preferences {
            display_preferences_dialog
          }
        }

        @gist_fetch = GistFetch.new
      end

      body {
        shell {
          grid_layout

          text 'Hello, List Multi Selection!'

          list(:multi) {
            # selection <=> [@person, :provinces] # also binds to provinces_options by convention
            selection <=> [@gist_fetch, :gists] # also binds to provinces_options by convention
          }

          button {
            text 'Reset Selections To Default Values'

            on_widget_selected { @gister.reset_gists! }
          }
        }
      }

      ## Use after_body block to setup observers for widgets in body
      #
      # after_body do
      #
      # end
      ## Add widget content inside custom shell body
      ## Top-most widget must be a shell or another custom shell
      #
      # body {
      #   shell {
      #     # Replace example content below with custom shell content
      #     minimum_size 420, 240
      #     image File.join(APP_ROOT, 'package', 'windows', "Thegist.ico") if OS.windows?
      #     text "Thegist - App View"
      #
      #     grid_layout
      #     label(:center) {
      #       text <= [self, :greeting]
      #       font height: 40
      #       layout_data :fill, :center, true, true
      #     }
      #
      #     menu_bar {
      #       menu {
      #         text '&File'
      #         menu_item {
      #           text '&About...'
      #           on_widget_selected {
      #             display_about_dialog
      #           }
      #         }
      #         menu_item {
      #           text '&Preferences...'
      #           on_widget_selected {
      #             display_preferences_dialog
      #           }
      #         }
      #       }
      #     }
      #   }
      # }
  
      def display_about_dialog
        message_box(body_root) {
          text 'About'
          message "Thegist #{VERSION}\n\n#{LICENSE}"
        }.open
      end
      
      def display_preferences_dialog
        dialog(swt_widget) {
          text 'Preferences'
          grid_layout {
            margin_height 5
            margin_width 5
          }
          group {
            row_layout {
              type :vertical
              spacing 10
            }
            text 'Greeting'
            font style: :bold
            [
              'Hello, World!',
              'Howdy, Partner!'
            ].each do |greeting_text|
              button(:radio) {
                text greeting_text
                selection <= [self, :greeting, on_read: ->(g) { g == greeting_text }]
                layout_data {
                  width 160
                }
                on_widget_selected { |event|
                  self.greeting = event.widget.getText
                }
              }
            end
          }
        }.open
      end
    end
  end
end
