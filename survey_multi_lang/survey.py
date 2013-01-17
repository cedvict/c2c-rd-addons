# -*- coding: utf-8 -*-
##############################################################################
#
#    OpenERP, Open Source Management Solution
#    Copyright (C) 2004-2010 Tiny SPRL (<http://tiny.be>).
#    Copyright (C) 2010-2012 Camptocamp Austria (<http://www.camptocamp.at>)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################
from osv import fields, osv

class survey(osv.osv):
    _inherit = 'survey'
    
    _columns = {
       'title': fields.char('Survey Title', size=255, required=1,  translate=True),
       'note': fields.text('Description', translate=True), 
      }
      
survey()
     
class survey_page(osv.osv):
    _inherit = 'survey.page'
    _columns = {
      'title': fields.char('Page Title', size=255, required=1, translate=True),
      'note': fields.text('Description', translate=True),
         }
      
survey_page()

class survey_question(osv.osv):
    _inherit = 'survey.question'
    _columns = {
        'question':  fields.char('Question', size=255, required=1, translate=True),
        'req_error_msg': fields.text('Error Message', translate=True),
        'descriptive_text': fields.text('Descriptive Text', size=255, translate=True),
        'comment_label': fields.char('Field Label', size = 255, translate=True),
        'comment_valid_err_msg': fields.text('Error message', translate=True),
        'make_comment_field_err_msg': fields.text('Error message', translate=True),
        'validation_valid_err_msg': fields.text('Error message', translate=True),
        'numeric_required_sum_err_msg': fields.text('Error message', translate=True),
        'column_name': fields.char('Column Name',size=256, translate=True),
     }
     
survey_question()

class survey_question_column_heading(osv.osv):
    _inherit = 'survey.question.column.heading'
    
    _columns = {
        'title': fields.char('Column Heading', size=128, required=1, translate=True),
        'menu_choice': fields.text('Menu Choice', translate=True),
        }
        
survey_question_column_heading()

class survey_answer(osv.osv):
    _inherit = 'survey.answer'
    
    _columns = {
        'answer': fields.char('Answer', size=255, required=1, translate=True),
        'menu_choice': fields.text('Menu Choices', translate=True),
        }
        
survey_answer()

class survey_response_line(osv.osv):
    _inherit = 'survey.response.line'
    
    _columns = {
       'comment': fields.text('Notes', translate=True),
       'single_text': fields.char('Text', size=255, translate=True),
       }

survey_response_line()

