local mapping_key_prefix = vim.g.ai_prefix_key or "<leader>a"

local COPILOT_EXPLAIN = string.format(
  [[You are a world-class coding tutor. Your code explanations perfectly balance high-level concepts and granular details. Your approach ensures that students not only understand how to write code, but also grasp the underlying principles that guide effective programming.
When asked for your name, you must respond with "GitHub Copilot".
Follow the user's requirements carefully & to the letter.
Your expertise is strictly limited to software development topics.
Follow Microsoft content policies.
Avoid content that violates copyrights.
For questions not related to software development, simply give a reminder that you are an AI programming assistant.
Keep your answers short and impersonal.
Use Markdown formatting in your answers.
Make sure to include the programming language name at the start of the Markdown code blocks.
Avoid wrapping the whole response in triple backticks.
The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
The active document is the source code the user is looking at right now.
You can only give one reply for each conversation turn.

Additional Rules
Think step by step:
1. Examine the provided code selection and any other context like user question, related errors, project details, class definitions, etc.
2. If you are unsure about the code, concepts, or the user's question, ask clarifying questions.
3. If the user provided a specific question or error, answer it based on the selected code and additional provided context. Otherwise focus on explaining the selected code.
4. Provide suggestions if you see opportunities to improve code readability, performance, etc.

Focus on being clear, helpful, and thorough without assuming extensive prior knowledge.
Use developer-friendly terms and analogies in your explanations.
Identify 'gotchas' or less obvious parts of the code that might trip up someone new.
Provide clear and relevant examples aligned with any provided context.
]]
)
local COPILOT_REVIEW = string.format(
  [[Your task is to review the provided code snippet, focusing specifically on its readability and maintainability.
Identify any issues related to:
- Naming conventions that are unclear, misleading or doesn't follow conventions for the language being used.
- The presence of unnecessary comments, or the lack of necessary ones.
- Overly complex expressions that could benefit from simplification.
- High nesting levels that make the code difficult to follow.
- The use of excessively long names for variables or functions.
- Any inconsistencies in naming, formatting, or overall coding style.
- Repetitive code patterns that could be more efficiently handled through abstraction or optimization.

Your feedback must be concise, directly addressing each identified issue with:
- A clear description of the problem.
- A concrete suggestion for how to improve or correct the issue.
  
Format your feedback as follows:
- Explain the high-level issue or problem briefly.
- Provide a specific suggestion for improvement.
 
If the code snippet has no readability issues, simply confirm that the code is clear and well-written as is.
]]
)
local COPILOT_REFACTOR = string.format(
  [[Your task is to refactor the provided code snippet, focusing specifically on its readability and maintainability.
Identify any issues related to:
- Naming conventions that are unclear, misleading or doesn't follow conventions for the language being used.
- The presence of unnecessary comments, or the lack of necessary ones.
- Overly complex expressions that could benefit from simplification.
- High nesting levels that make the code difficult to follow.
- The use of excessively long names for variables or functions.
- Any inconsistencies in naming, formatting, or overall coding style.
- Repetitive code patterns that could be more efficiently handled through abstraction or optimization.
]]
)

return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { mapping_key_prefix, group = "AI Code Companion", mode = { "n", "v" } },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      "ravitemer/mcphub.nvim",
    },
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet",
              },
            },
          })
        end,
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "llama3:latest", -- or any model you prefer
                description = "Ollama model to use",
                items = {
                  "deepseek-r1:14b",
                  "gemma3:12b",
                  "llama3:latest",
                  "mistral-small3.1",
                  "qwen3:14b",
                },
              },
            },
            -- Configure Ollama API endpoint - default is http://localhost:11434/api
            api_url = "http://localhost:11434/api",
          })
        end,
        -- claude = function()
        --   return require("codecompanion.adapters").extend("claude", {
        --     -- schema = {
        --     --   model = {
        --     --     default = "claude-3.7-sonnet",
        --     --   },
        --     -- },
        --     aws = {
        --       region = "us-west-2", -- Replace with your AWS region
        --       access_key_id = os.getenv("AWS_ACCESS_KEY_ID"),
        --       secret_access_key = os.getenv("AWS_SECRET_ACCESS_KEY"),
        --       session_token = os.getenv("AWS_SESSION_TOKEN"), -- Optional, if using temporary credentials
        --     },
        --     aws = {
        --       region = "us-west-2", -- Replace with your AWS region
        --       profile = "your-sso-profile", -- Replace with your SSO profile name
        --     },
        --   })
        -- end,
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = "copilot",
          adapters = {
            copilot = { title = "Claude" },
            ollama = { title = "Ollama" },
          },
        },
        inline = {
          adapter = "copilot",
          adapters = {
            copilot = { title = "Claude" },
            ollama = { title = "Ollama" },
          },
        },
        agent = {
          adapter = "copilot",
          adapters = {
            copilot = { title = "Claude" },
            ollama = { title = "Ollama" },
          },
        },
      },
      display = {
        chat = {
          auto_scroll = false,
        },
      },
      prompt_library = {
        -- ["Switch to Ollama Gemma3"] = {
        --   strategy = "chat",
        --   description = "Using Gemma3 to chat",
        --   opts = {
        --     adapter = {
        --       name = "ollama",
        --       model = "gemma3:12b",
        --     },
        --   },
        -- },
        -- ["Switch to Ollama Llama3"] = {
        --   strategy = "chat",
        --   description = "Using Llama3 to chat",
        --   opts = {
        --     adapter = {
        --       name = "ollama",
        --       model = "llama3:latest",
        --     },
        --   },
        -- },
        -- Custom the default prompt
        ["Generate a Commit Message"] = {
          prompts = {
            {
              role = "user",
              content = function()
                return "Write commit message with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
                  .. "\n\n```\n"
                  .. vim.fn.system("git diff")
                  .. "\n```"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Explain"] = {
          strategy = "chat",
          description = "Explain how code in a buffer works",
          opts = {
            default_prompt = true,
            modes = { "v" },
            short_name = "explain",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_EXPLAIN,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please explain how the following code works:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Explain Code"] = {
          strategy = "chat",
          description = "Explain how code works",
          opts = {
            short_name = "explain-code",
            auto_submit = false,
            is_slash_cmd = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_EXPLAIN,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = [[Please explain how the following code works.]],
            },
          },
        },
        -- Add custom prompts
        ["Generate a Commit Message for Staged"] = {
          strategy = "chat",
          description = "Generate a commit message for staged change",
          opts = {
            short_name = "staged-commit",
            auto_submit = true,
            is_slash_cmd = true,
          },
          prompts = {
            {
              role = "user",
              content = function()
                return "Write commit message for the change with commitizen convention. Write clear, informative commit messages that explain the 'what' and 'why' behind changes, not just the 'how'."
                  .. "\n\n```\n"
                  .. vim.fn.system("git diff --staged")
                  .. "\n```"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Inline Document"] = {
          strategy = "inline",
          description = "Add documentation for code.",
          opts = {
            modes = { "v" },
            short_name = "inline-doc",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please provide documentation in comment code for the following code and suggest to have better naming to improve readability.\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Document"] = {
          strategy = "chat",
          description = "Write documentation for code.",
          opts = {
            modes = { "v" },
            short_name = "doc",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please brief how it works and provide documentation in comment code for the following code. Also suggest to have better naming to improve readability.\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Review"] = {
          strategy = "chat",
          description = "Review the provided code snippet.",
          opts = {
            modes = { "v" },
            short_name = "review",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REVIEW,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please review the following code and provide suggestions for improvement then refactor the following code to improve its clarity and readability:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Review Code"] = {
          strategy = "chat",
          description = "Review code and provide suggestions for improvement.",
          opts = {
            short_name = "review-code",
            auto_submit = false,
            is_slash_cmd = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REVIEW,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = "Please review the following code and provide suggestions for improvement then refactor the following code to improve its clarity and readability.",
            },
          },
        },
        ["Refactor"] = {
          strategy = "inline",
          description = "Refactor the provided code snippet.",
          opts = {
            modes = { "v" },
            short_name = "refactor",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REFACTOR,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please refactor the following code to improve its clarity and readability:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Refactor Code"] = {
          strategy = "chat",
          description = "Refactor the provided code snippet.",
          opts = {
            short_name = "refactor-code",
            auto_submit = false,
            is_slash_cmd = true,
          },
          prompts = {
            {
              role = "system",
              content = COPILOT_REFACTOR,
              opts = {
                visible = false,
              },
            },
            {
              role = "user",
              content = "Please refactor the following code to improve its clarity and readability.",
            },
          },
        },
        ["Naming"] = {
          strategy = "inline",
          description = "Give betting naming for the provided code snippet.",
          opts = {
            modes = { "v" },
            short_name = "naming",
            auto_submit = true,
            user_prompt = false,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "user",
              content = function(context)
                local code = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "Please provide better names for the following variables and functions:\n\n```"
                  .. context.filetype
                  .. "\n"
                  .. code
                  .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
        ["Better Naming"] = {
          strategy = "chat",
          description = "Give betting naming for the provided code snippet.",
          opts = {
            short_name = "better-naming",
            auto_submit = false,
            is_slash_cmd = true,
          },
          prompts = {
            {
              role = "user",
              content = "Please provide better names for the following variables and functions.",
            },
          },
        },
      },
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,

    keys = {
      {
        mapping_key_prefix .. "s",
        function()
          vim.ui.select({ "copilot", "ollama" }, { prompt = "Select AI adapter" }, function(choice)
            if choice then
              local codecompanion = require("codecompanion")
              -- Use the setup function to update configuration
              codecompanion.setup({
                strategies = {
                  chat = { adapter = choice },
                  inline = { adapter = choice },
                  agent = { adapter = choice },
                },
              })
            end
          end)
        end,
        desc = "Code Companion - Switch adapter",
      },
      -- {
      --   mapping_key_prefix .. "o",
      --   function()
      --     local models = {
      --       "gemma3:12b",
      --       "llama3:latest",
      --     }
      --     vim.ui.select(models, { prompt = "Select Ollama model" }, function(choice)
      --       if choice then
      --         local codecompanion = require("codecompanion")
      --         codecompanion.setup({
      --           adapters = {
      --             ollama = function()
      --               return require("codecompanion.adapters").extend("ollama", {
      --                 schema = {
      --                   model = {
      --                     default = choice,
      --                   },
      --                 },
      --               })
      --             end,
      --           },
      --         })
      --       end
      --     end)
      --   end,
      --   desc = "Code Companion - Switch Ollama model",
      -- },
      -- Recommend setup
      {
        mapping_key_prefix .. "c",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Code Companion - Actions",
      },
      {
        mapping_key_prefix .. "n",
        function()
          require("codecompanion").chat("add")
        end,
        desc = "Code Companion - New",
      },
      {
        mapping_key_prefix .. "a",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Code Companion - Toggle",
        mode = { "n", "v" },
      },
      -- Some common usages with visual mode
      {
        mapping_key_prefix .. "e",
        "<cmd>CodeCompanion /explain<cr>",
        desc = "Code Companion - Explain code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "f",
        "<cmd>CodeCompanion /fix<cr>",
        desc = "Code Companion - Fix code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "l",
        "<cmd>CodeCompanion /lsp<cr>",
        desc = "Code Companion - Explain LSP diagnostic",
        mode = { "n", "v" },
      },
      {
        mapping_key_prefix .. "t",
        "<cmd>CodeCompanion /tests<cr>",
        desc = "Code Companion - Generate unit test",
        mode = "v",
      },
      {
        mapping_key_prefix .. "M",
        "<cmd>CodeCompanion /commit<cr>",
        desc = "Code Companion - Git commit message",
      },
      -- Custom prompts
      -- {
      --   mapping_key_prefix .. "M",
      --   "<cmd>CodeCompanion /staged-commit<cr>",
      --   desc = "Code Companion - Git commit message (staged)",
      -- },
      {
        mapping_key_prefix .. "d",
        "<cmd>CodeCompanion /inline-doc<cr>",
        desc = "Code Companion - Inline document code",
        mode = "v",
      },
      { mapping_key_prefix .. "D", "<cmd>CodeCompanion /doc<cr>", desc = "Code Companion - Document code", mode = "v" },
      {
        mapping_key_prefix .. "r",
        "<cmd>CodeCompanion /refactor<cr>",
        desc = "Code Companion - Refactor code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "R",
        "<cmd>CodeCompanion /review<cr>",
        desc = "Code Companion - Review code",
        mode = "v",
      },
      {
        mapping_key_prefix .. "n",
        "<cmd>CodeCompanion /naming<cr>",
        desc = "Code Companion - Better naming",
        mode = "v",
      },
      -- Quick chat
      {
        mapping_key_prefix .. "q",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CodeCompanion " .. input)
          end
        end,
        desc = "Code Companion - Quick chat",
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     sources = {
  --       per_filetype = {
  --         codecompanion = { "codecompanion" },
  --       },
  --     },
  --   },
  -- },
}
