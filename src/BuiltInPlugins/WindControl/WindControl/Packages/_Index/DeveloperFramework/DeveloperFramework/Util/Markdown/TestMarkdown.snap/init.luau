return {
    children = {
        {
            attributes = {
                depth = 1
            }, 
            children = {
                {
                    name = "TEXT", 
                    offset = 2, 
                    text = "Heading with "
                }, 
                {
                    attributes = {
                        style = "ITALIC"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 17, 
                            text = "italic"
                        }
                    }, 
                    name = "STYLED_TEXT", 
                    offset = 16
                }, 
                {
                    name = "TEXT", 
                    offset = 24, 
                    text = " text"
                }
            }, 
            isBlock = true, 
            name = "HEADING", 
            offset = 0
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 30, 
                    text = "# Not a heading."
                }
            }, 
            name = "PARAGRAPH", 
            offset = 30
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 49, 
                    text = "Some paragraph text with some "
                }, 
                {
                    attributes = {
                        style = "BOLD"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 81, 
                            text = "bold"
                        }
                    }, 
                    name = "STYLED_TEXT", 
                    offset = 80
                }, 
                {
                    name = "TEXT", 
                    offset = 86, 
                    text = ", "
                }, 
                {
                    attributes = {
                        style = "ITALIC"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 89, 
                            text = "italic"
                        }
                    }, 
                    name = "STYLED_TEXT", 
                    offset = 88
                }, 
                {
                    name = "TEXT", 
                    offset = 96, 
                    text = ", "
                }, 
                {
                    attributes = {
                        style = "STRIKE"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 99, 
                            text = "strike"
                        }
                    }, 
                    name = "STYLED_TEXT", 
                    offset = 98
                }, 
                {
                    name = "TEXT", 
                    offset = 106, 
                    text = " text, and a "
                }, 
                {
                    name = "INLINE_CODE", 
                    offset = 119, 
                    text = "code *snippet_"
                }, 
                {
                    name = "TEXT", 
                    offset = 135, 
                    text = ".\nSome basic content in the same paragraph."
                }
            }, 
            name = "PARAGRAPH", 
            offset = 49
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 179, 
                    text = "Some basic content in a separate paragraph."
                }
            }, 
            name = "PARAGRAPH", 
            offset = 179
        }, 
        {
            children = {
                {
                    children = {
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 226, 
                                    text = "Heading A"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 226
                        }, 
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 238, 
                                    text = "Heading B"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 238
                        }
                    }, 
                    isBlock = true, 
                    name = "TABLE_HEADER", 
                    offset = 224
                }, 
                {
                    children = {
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 266, 
                                    text = "Content A"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 266
                        }, 
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 278, 
                                    text = "Content B \n with a newline"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 278
                        }
                    }, 
                    isBlock = true, 
                    name = "TABLE_ROW", 
                    offset = 264
                }, 
                {
                    children = {
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 312, 
                                    text = "Content C"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 312
                        }, 
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 324, 
                                    text = "-"
                                }
                            }, 
                            name = "TABLE_CELL", 
                            offset = 324
                        }
                    }, 
                    isBlock = true, 
                    name = "TABLE_ROW", 
                    offset = 310
                }
            }, 
            name = "TABLE", 
            offset = 224
        }, 
        {
            attributes = {
                depth = 2
            }, 
            children = {
                {
                    name = "TEXT", 
                    offset = 332, 
                    text = "Code block"
                }
            }, 
            isBlock = true, 
            name = "HEADING", 
            offset = 329
        }, 
        {
            attributes = {
                language = "lua"
            }, 
            name = "CODE_BLOCK", 
            offset = 344, 
            text = "-- factorial function\nfunction fact(n)\n  if n == 0 then\n    return 1\n  else\n    return n * fact(n-1)\n  end\nend\n\nprint(\"enter a number:\")\na = io.read(\"*number\")\nprint(fact(a))"
        }, 
        {
            isBlock = true, 
            name = "DIVIDER", 
            offset = 531
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 536, 
                    text = "Non-lua code block:"
                }
            }, 
            name = "PARAGRAPH", 
            offset = 536
        }, 
        {
            attributes = {
                language = "ruby"
            }, 
            name = "CODE_BLOCK", 
            offset = 557, 
            text = "class Integer\n  def fact\n    (1..self).reduce(:*) || 1\n  end\nend"
        }, 
        {
            attributes = {
                depth = 3
            }, 
            children = {
                {
                    name = "TEXT", 
                    offset = 639, 
                    text = "Really sub-heading with a "
                }, 
                {
                    name = "LINK", 
                    offset = 666, 
                    text = "link", 
                    url = "http://example.com"
                }
            }, 
            isBlock = true, 
            name = "HEADING", 
            offset = 635
        }, 
        {
            attributes = {
                depth = 0
            }, 
            children = {
                {
                    attributes = {
                        depth = 0, 
                        prefix = "1"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 696, 
                            text = "Number list one"
                        }
                    }, 
                    isBlock = true, 
                    name = "LIST_ITEM", 
                    offset = 693
                }, 
                {
                    attributes = {
                        depth = 2
                    }, 
                    children = {
                        {
                            attributes = {
                                depth = 2, 
                                prefix = "a"
                            }, 
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 717, 
                                    text = "Sub-list one with a "
                                }, 
                                {
                                    name = "LINK", 
                                    offset = 738, 
                                    text = "link", 
                                    url = "http://example.com"
                                }
                            }, 
                            isBlock = true, 
                            name = "LIST_ITEM", 
                            offset = 712
                        }, 
                        {
                            attributes = {
                                depth = 2, 
                                prefix = "b"
                            }, 
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 769, 
                                    text = "Sub-list "
                                }, 
                                {
                                    attributes = {
                                        style = "BOLD"
                                    }, 
                                    children = {
                                        {
                                            name = "TEXT", 
                                            offset = 780, 
                                            text = "two"
                                        }
                                    }, 
                                    name = "STYLED_TEXT", 
                                    offset = 779
                                }
                            }, 
                            isBlock = true, 
                            name = "LIST_ITEM", 
                            offset = 764
                        }
                    }, 
                    name = "LIST", 
                    offset = 712
                }, 
                {
                    attributes = {
                        depth = 0, 
                        prefix = "2"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 787, 
                            text = "Number list two"
                        }
                    }, 
                    isBlock = true, 
                    name = "LIST_ITEM", 
                    offset = 784
                }, 
                {
                    attributes = {
                        depth = 0, 
                        prefix = "3"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 806, 
                            text = "Number list three"
                        }
                    }, 
                    isBlock = true, 
                    name = "LIST_ITEM", 
                    offset = 803
                }
            }, 
            name = "LIST", 
            offset = 693
        }, 
        {
            isBlock = true, 
            name = "DIVIDER_2", 
            offset = 825
        }, 
        {
            attributes = {
                depth = 0
            }, 
            children = {
                {
                    attributes = {
                        depth = 0, 
                        prefix = "-"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 832, 
                            text = "Bullet one"
                        }
                    }, 
                    isBlock = true, 
                    name = "LIST_ITEM", 
                    offset = 830
                }, 
                {
                    attributes = {
                        depth = 0, 
                        prefix = "*"
                    }, 
                    children = {
                        {
                            name = "TEXT", 
                            offset = 845, 
                            text = "Bullet two with an "
                        }, 
                        {
                            name = "ACTION", 
                            offset = 865, 
                            text = "[[action]]"
                        }, 
                        {
                            name = "TEXT", 
                            offset = 875, 
                            text = " and a "
                        }, 
                        {
                            name = "LINK", 
                            offset = 882, 
                            text = "link", 
                            url = "http://example.com"
                        }
                    }, 
                    isBlock = true, 
                    name = "LIST_ITEM", 
                    offset = 843
                }
            }, 
            name = "LIST", 
            offset = 830
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 909, 
                    text = "Some"
                }
            }, 
            name = "PARAGRAPH", 
            offset = 909
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 916, 
                    text = "quoted text"
                }
            }, 
            isBlock = true, 
            name = "QUOTE", 
            offset = 914
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 929, 
                    text = "Some "
                }
            }, 
            name = "PARAGRAPH", 
            offset = 929
        }, 
        {
            attributes = {
                style = "color: #fff"
            }, 
            children = {
                {
                    children = {
                        {
                            name = "TEXT", 
                            offset = 960, 
                            text = "custom tag with a "
                        }
                    }, 
                    name = "PARAGRAPH", 
                    offset = 960
                }, 
                {
                    children = {
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 984, 
                                    text = "span inside"
                                }
                            }, 
                            name = "PARAGRAPH", 
                            offset = 984
                        }
                    }, 
                    name = "TAG", 
                    offset = 978, 
                    text = "span"
                }
            }, 
            name = "TAG", 
            offset = 935, 
            text = "div"
        }, 
        {
            children = {
                {
                    name = "TEXT", 
                    offset = 1008, 
                    text = "."
                }
            }, 
            name = "PARAGRAPH", 
            offset = 1008
        }, 
        {
            children = {
                {
                    children = {
                        {
                            name = "TEXT", 
                            offset = 1016, 
                            text = "    Multiline"
                        }
                    }, 
                    name = "PARAGRAPH", 
                    offset = 1016
                }, 
                {
                    children = {
                        {
                            name = "TEXT", 
                            offset = 1031, 
                            text = "    "
                        }
                    }, 
                    name = "PARAGRAPH", 
                    offset = 1031
                }, 
                {
                    children = {
                        {
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 1039, 
                                    text = "bold text"
                                }
                            }, 
                            name = "PARAGRAPH", 
                            offset = 1039
                        }
                    }, 
                    name = "TAG", 
                    offset = 1036, 
                    text = "b"
                }, 
                {
                    attributes = {
                        depth = 4
                    }, 
                    children = {
                        {
                            attributes = {
                                depth = 4, 
                                prefix = "*"
                            }, 
                            children = {
                                {
                                    name = "TEXT", 
                                    offset = 1059, 
                                    text = "A list element with "
                                }, 
                                {
                                    children = {
                                        {
                                            children = {
                                                {
                                                    name = "TEXT", 
                                                    offset = 1086, 
                                                    text = "a tag"
                                                }
                                            }, 
                                            name = "PARAGRAPH", 
                                            offset = 1086
                                        }
                                    }, 
                                    name = "TAG", 
                                    offset = 1080, 
                                    text = "span"
                                }, 
                                {
                                    name = "TEXT", 
                                    offset = 1098, 
                                    text = "."
                                }
                            }, 
                            isBlock = true, 
                            name = "LIST_ITEM", 
                            offset = 1053
                        }
                    }, 
                    name = "LIST", 
                    offset = 1053
                }
            }, 
            name = "TAG", 
            offset = 1011, 
            text = "div"
        }, 
        {
            name = "PARAGRAPH", 
            offset = 1107, 
            children = {
                {
                    name = "TEXT", 
                    offset = 1107, 
                    text = "An "
                }, 
                {
                    children = {}, 
                    name = "IMAGE", 
                    offset = 1111, 
                    text = "Image", 
                    url = "rbxassetid://123456"
                }
            }
        }
    }, 
    name = "ROOT", 
    offset = 1
};