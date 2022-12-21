overlay_controls = input('overlay_controls')
system_categorization = input('system_categorization')

include_controls 'k8s-node-stig-baseline' do

  ## Semantic changes

  control 'V-242382' do
  desc  "To mitigate the risk of unauthorized access to sensitive information
  by entities that have been issued certificates by CMS-approved PKIs, all CMS
  systems (e.g., networks, web servers, and web portals) must be properly
  configured to incorporate access control methods that do not rely solely on the
  possession of a certificate for access. Successful authentication must not
  automatically give an entity access to an asset or security boundary.
  Authorization procedures and controls must be implemented to ensure each
  authenticated entity also has a validated and current authorization.
  Authorization is the process of determining whether an entity, once
  authenticated, is permitted to access a specific asset.

    Node,RBAC is the method within Kubernetes to control access of users and
  applications. Kubernetes uses roles to grant authorization API requests made by
  kubelets."
  end

  
  ## NA due to the requirement not included in CMS ARS 5.0
  unless overlay_controls.empty?
    overlay_controls.each do |overlay_control|
      control overlay_control do
        impact 0.0
        desc "caveat", "Not applicable for this CMS ARS 5.0 overlay, since the requirement is not included in CMS ARS 5.0"
      end
    end
  end
end