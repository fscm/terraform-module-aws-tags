#
# Terraform module to manage resource's tags.
#
# Copyright 2016-2022, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

#
# Local Values.
#
locals {
  _allowed_chars_ = "/[^a-zA-Z0-9-.]/"
  _tags_merged_   = merge(local._tags_default_, var.tags)
  _id_            = join(var.delimiter, compact([for v in var.id_tags_order : lower(replace(lookup(local._tags_merged_, v, ""), local._allowed_chars_, ""))]))
  _tags_default_ = {
    environment = var.environment
    name        = var.name
    namespace   = var.namespace
    stage       = var.stage
    terraform   = "true"
  }
  _tags_       = { for k, v in local._tags_merged_ : title(lower(k)) => v if v != "" }
  _uuid_       = uuidv5("ca64526f-6651-17f8-d44f-2b773123e6fb", local._id_)
  _uuid_short_ = element(split("-", local._uuid_), 0)
}
